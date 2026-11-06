/**
 * First-prompt widget
 *
 * Shows the session's first user prompt in a widget directly above the
 * input editor, so each pi window is identifiable at a glance. The header
 * is not touched — it scrolls off with output, this widget is persistent.
 *
 * /first-prompt      - show the full first prompt (widget line is truncated)
 * /first-prompt off  - remove the widget
 */

import type { ExtensionAPI, ExtensionContext, Theme } from "@earendil-works/pi-coding-agent";
import { truncateToWidth, visibleWidth } from "@earendil-works/pi-tui";

/** Collapse to one line so multi-line prompts still render as a single widget row. */
function normalize(text: string): string {
	return text.replace(/\s+/g, " ").trim();
}

function firstUserPrompt(ctx: ExtensionContext): string | undefined {
	for (const entry of ctx.sessionManager.getEntries()) {
		if (entry.type !== "message" || entry.message.role !== "user") continue;
		const content = entry.message.content;
		const text =
			typeof content === "string"
				? content
				: content.filter((b) => b.type === "text").map((b) => b.text).join(" ");
		const oneLine = normalize(text);
		if (oneLine) return oneLine;
	}
	return undefined;
}

export default function (pi: ExtensionAPI) {
	// Resolved lazily: undefined until the first user prompt exists.
	let cached: string | undefined;
	let enabled = true;

	function installWidget(ctx: ExtensionContext) {
		if (!ctx.hasUI) return;
		ctx.ui.setWidget("first-prompt", (_tui, theme: Theme) => ({
			render(width: number): string[] {
				if (!enabled || !cached) return [];
				// Same color function the editor box border uses, so the widget
				// tracks the prompt box as its thinking-level color changes.
				const color = theme.getThinkingBorderColor(ctx.thinkingLevel ?? "off");
				const label = color("❯ ");
				const budget = width - visibleWidth(label) - 1;
				if (budget <= 0) return [];
				const body =
					cached.length > budget ? cached.slice(0, budget - 1) + "…" : cached;
				return [label + color(body)];
			},
			invalidate() {},
		}));
	}

	pi.on("session_start", async (_event, ctx) => {
		cached = firstUserPrompt(ctx); // fresh session may have none yet
		installWidget(ctx);
	});

	// Brand-new sessions: capture the first prompt when the run starts.
	pi.on("before_agent_start", async (event, ctx) => {
		if (cached || event.messageType !== "user") return;
		const oneLine = normalize(event.prompt ?? "");
		if (oneLine) {
			cached = oneLine;
			installWidget(ctx); // re-install so the closure picks it up next render
		}
	});

	pi.registerCommand("first-prompt", {
		description: "Show full first prompt, or 'off'/'on' to toggle the widget",
		handler: async (args, ctx) => {
			const arg = args.trim();
			if (arg === "off") {
				enabled = false;
				ctx.ui.setWidget("first-prompt", undefined);
				ctx.ui.notify("First-prompt widget removed", "info");
				return;
			}
			if (arg === "on") {
				enabled = true;
				installWidget(ctx);
				ctx.ui.notify("First-prompt widget enabled", "info");
				return;
			}
			if (!cached) cached = firstUserPrompt(ctx);
			ctx.ui.notify(cached ?? "No user prompt yet", "info");
		},
	});
}
