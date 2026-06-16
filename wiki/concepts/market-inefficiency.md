---
id: "019e1b12-a1e9-7cac-f71f-855f7a8b9c36"
title: "Market Inefficiency"
type: concept
created: "2026-05-10T15:45:00-0400"
updated: "2026-06-15"
tags: [economics, markets, information, arbitrage, decision-making, sports, prediction-markets, provenance]
source_count: 19
---

# Market Inefficiency

A situation where the collective pricing of assets, goods, or talent systematically deviates from true value due to shared biases, incomplete information, or structural constraints on analysis. Market inefficiencies create opportunities for those with superior analytical frameworks to capture value before the market corrects.

## Sources

- [2026-05-10: Moneyball — Wisdom Extracted](sources/moneyball.md) — Baseball scouts overvalued batting average and stolen bases while undervaluing on-base percentage; Oakland exploited this for a decade
- [2026-05-10: The Wisdom of Crowds — Wisdom Extracted](sources/the-wisdom-of-crowds.md) — Crowds become "dumb" when independence is compromised by shared tradition — exactly what happened in baseball
- [2026-05-10: Bringing Down the House — Wisdom Extracted](sources/bringing-down-the-house.md) — Casinos assumed narrative stereotypes ("high-rolling Asian gamblers") rather than mathematical reality, creating exploitable blind spots
- [2026-06-08: Newsletter 2026-06-08 — Morning Dispatch](../sources/newsletter-2026-06-08.md) — Prediction-market fragments and split-tape equity behavior show information quality varies sharply by market venue and asset class.
- [2026-06-08: Evening Brief — Monday, June 8, 2026](../sources/newsletter-2026-06-08-evening.md) — The close preserved the split tape, while Polymarket chatter and blocked Kalshi extraction showed that forecast signals can be degraded by data-access and parsing constraints.
- [2026-06-09: Newsletter 2026-06-09 — Morning Dispatch](../sources/newsletter-2026-06-09.md) — Polymarket again returned unstructured trending text and Kalshi extraction failed/blocked, while the equity tape remained internally split between growth losers and value/quality winners.
- [2026-06-09: Evening Brief — Tuesday, June 9, 2026](../sources/newsletter-2026-06-09-evening.md) — Polymarket returned Spurs and Peru-election fragments without clean movement deltas, while Kalshi extraction failed/blocked; the source is useful as a provenance warning more than as a forecast signal.
- [2026-06-10: Newsletter 2026-06-10 — Morning Dispatch](../sources/newsletter-2026-06-10.md) — Polymarket again returns partial Spurs and Peru-election snippets while Kalshi is unavailable, preserving the distinction between market signal and collection artifact.
- [2026-06-10: Evening Brief — Wednesday, June 10, 2026](../sources/newsletter-2026-06-10-evening.md) — Both Polymarket and Kalshi are unavailable in the raw fetch, turning the prediction-market section into a provenance failure rather than a forecast input.
- [2026-06-11: Newsletter 2026-06-11 — Morning Dispatch](../sources/newsletter-2026-06-11.md) — Polymarket returns only discussion chatter and Kalshi is unavailable, again making collection quality the useful signal rather than any forecast movement.
- [2026-06-11: Evening Brief — Thursday, June 11, 2026](../sources/newsletter-2026-06-11-evening.md) — Polymarket returns World Cup and Iran-war chatter without clean mover percentages, while Kalshi extraction fails or is blocked; provenance failure remains the signal.
- [2026-06-12: Newsletter 2026-06-12 — Morning Dispatch](../sources/newsletter-2026-06-12.md) — Polymarket shows World Cup, Iran-war, and SpaceX IPO markets without clean IDs, prices, deltas, or liquidity context, while Kalshi is unavailable.
- [2026-06-12: Evening Brief — Friday, June 12, 2026](../sources/newsletter-2026-06-12-evening.md) — Polymarket returns topic text around United States-Paraguay and SpaceX IPO market cap without usable odds or movement; Kalshi extraction again fails or is blocked.
- [2026-06-13: Newsletter 2026-06-13 — Morning Dispatch](../sources/newsletter-2026-06-13.md) — Polymarket returns Qatar/Switzerland, Portugal World Cup, and Trump/U.S.-Iran ceasefire chatter without clean prices or deltas; Kalshi extraction fails or is blocked.
- [2026-06-13: Evening Brief — Saturday, June 13, 2026](../sources/newsletter-2026-06-13-evening.md) — Polymarket returns Iran-topic probabilities, but without sufficient market IDs, deltas, liquidity, and timestamp context; Kalshi extraction again fails or is blocked.
- [2026-06-14: Newsletter 2026-06-14 — Morning Dispatch](../sources/newsletter-2026-06-14.md) — Polymarket surfaces U.S.-Iran peace-deal and Portugal World Cup chatter without a clean odds/mover table, while Kalshi extraction fails or is blocked.
- [2026-06-14: Evening Brief — Sunday, June 14, 2026](../sources/newsletter-2026-06-14-evening.md) — Polymarket shows sports and Iran-deal demand snippets, including oil-sanction relief and uranium-enrichment probabilities, but Kalshi extraction fails and the section still lacks clean IDs, liquidity, deltas, and timestamps.
- [2026-06-15: Newsletter 2026-06-15 — Morning Dispatch](../sources/newsletter-2026-06-15.md) — Polymarket lists Iran peace-deal probabilities, including oil-sanction relief, uranium enrichment, Strait transit fees, and asset-unfreezing, but Kalshi extraction fails and the feed still lacks enough context for forecast use.
- [2026-06-15: Evening Brief — Monday, June 15, 2026](../sources/newsletter-2026-06-15-evening.md) — Polymarket returns partial World Cup percentages for Saudi Arabia-Uruguay and Iran-New Zealand while Kalshi is unavailable; sports odds are present, but provenance remains thin.

## Related Concepts

- [[Sabermetrics]]
- [[Information Arbitrage]]
- [[Cognitive Bias in Expert Judgment]]
- [[Collective Intelligence]]
- [[Advantage Play]]

## Notes

Market inefficiency is the shared engine of three very different stories: a baseball team, a blackjack team, and a stock market. In each case, the mechanism is identical: a closed community of experts reinforces shared assumptions that a rigorous outsider can disprove with data. The inefficiency persists because challenging it requires both analytical skill and the courage to defy institutional consensus — the same combination Emerson celebrates in [[Self-Reliance]] and Ellison dramatizes in [[The Invisible Man]].

The June 8 newsletters' fragmented prediction-market extraction is a reminder that market signals are only as good as their liquidity, access, and data quality. A number like "Spurs 22%," fuzzy Spurs/Knicks chatter, or a blocked Kalshi scrape is not just a forecast; it is also an artifact of collection constraints.

June 9 repeats the warning. When prediction-market extraction fails on consecutive dispatches, the right inference is not "no signal"; it is "collection pipeline degraded." Treat those fields as provenance notes until a cleaner feed is available.

The evening edition confirms that discipline: Spurs 38% and Peru-election snippets are not enough to infer movement. Without deltas, liquidity context, and clean question identifiers, prediction-market blurbs are weak evidence.

The June 10 source repeats the same failure mode. When the same prediction-market fields arrive as snippets across multiple dispatches, the wiki should track the provenance problem itself rather than treat the numbers as clean forecasts.

The June 10 evening source is even cleaner as a warning: no Polymarket or Kalshi data is available at all. That absence is information about the data pipeline, not information about the underlying forecast markets.

The June 11 morning source preserves the same lesson with a slightly different failure mode: chatter without a clean mover is still not a forecast. Prediction-market notes need market identifiers, prices, deltas, and liquidity context before they can be treated as evidence.

The evening source repeats the same failure mode around World Cup and Iran-war markets. The wiki should treat this as a collection-pipeline issue until the feed supplies clean market IDs, prices, movement deltas, and liquidity.

The June 12 morning dispatch extends the warning to SpaceX IPO markets alongside World Cup and Iran-war markets. Topic labels alone are not enough; without question IDs, current prices, previous prices, volume/liquidity, and timestamps, prediction-market blurbs should not drive conclusions.

The evening dispatch repeats the same issue with fewer topics but no more evidence. A match label or IPO-market label is not a forecast without price, delta, liquidity, and timestamp context. The data pipeline is still producing provenance notes, not tradeable prediction signals.

The June 13 morning dispatch confirms the problem is persistent across topic domains. World Cup labels and Iran ceasefire chatter may be useful watchlist prompts, but without IDs, odds, deltas, liquidity, and timestamps they are not forecast evidence.

The evening dispatch supplies more specific Iran-topic percentages, but the same discipline applies. Probabilities without clean question IDs, previous prices, liquidity, and collection timestamps are watchlist prompts, not actionable forecast evidence.

The June 14 morning dispatch confirms the pipeline problem across another cycle. U.S.-Iran and World Cup prediction-market references may identify topics worth watching, but without odds, deltas, liquidity, identifiers, and timestamps they remain provenance artifacts rather than forecast evidence.

The evening dispatch supplies more specific topic labels and a couple of percentages, but not enough context to upgrade the evidence. A probability attached to “Oil Sanction Relief” or “Enrichment of Uranium” still needs market identity, prior price, liquidity, timestamp, and resolution language before it can be treated as a forecast rather than a collection artifact.

The June 15 morning dispatch repeats that limitation. The Iran probabilities are useful as a watchlist of live questions, but not as clean forecast evidence until the pipeline provides market IDs, resolution text, liquidity, prior prices, and collection timestamps.

The June 15 evening dispatch shows the same failure mode in sports markets. A pair of team percentages can orient attention, but without market IDs, prior prices, liquidity, and timestamps, the numbers are watchlist context rather than reliable probabilistic evidence.
