---
id: "ff0511c3-f957-4f8c-9a75-7ecc8ba8cdbe"
title: "How Our RAPTOR Metric Works"
type: source
source_type: article
created: "2026-05-14T23:10:00-0400"
updated: "2026-05-14T23:10:00-0400"
tags: [basketball, nba, analytics, statistics, plus-minus, player-tracking, sabermetrics, fivethirtyeight]
source_path: pinky/raw/fivethirtyeight-raptor-metric-how-it-works.md
---

# How Our RAPTOR Metric Works

**Author:** FiveThirtyEight / Nate Silver  
**Date:** 2019  
**Source:** [pinky/raw/fivethirtyeight-raptor-metric-how-it-works.md](../source_path)

## Summary

RAPTOR (Robust Algorithm using Player Tracking and On/Off Ratings) is FiveThirtyEight's NBA player evaluation metric introduced in 2019. It combines a "box" component — regression-based player value derived from box score, player tracking, and play-by-play data — with an "on-off" component that evaluates team performance when a player and his teammates are on or off the floor. Both components are fitted against long-term Real Adjusted Plus Minus (RAPM) as the ground truth. The metric is designed to reflect how modern NBA teams actually value players: floor spacing, shot creation, and defense are naturally emphasized by the regression, not deliberately overweighted.

The article is the canonical technical explanation of the metric. It breaks down every regression input for both offense and defense, explains the score effects and team effects adjustments, introduces the predictive variant PREDATOR, and describes how RAPTOR feeds into team projections (depth charts → weighted sum → Pythagorean expectation) and player market values. It also introduces Approximate RAPTOR for historical players (1976–77 onward) using limited pre-tracking data.

## Key Claims

1. **Box RAPTOR carries ~85% weight, On-Off ~21%.** Box statistics stabilized much faster than on-off ratings and were more predictive of out-of-sample RAPM. The medium-term future of NBA analytics lies in assigning value to discrete on-court actions rather than refining RAPM-like approaches.
2. **The metric values modern skills organically.** Perimeter creation, contested three-point attempts (as a spacing proxy), and defensive versatility are all naturally rewarded by the regression. Ball-dominant scorers (Harden, Curry) and two-way wings (Leonard, George) rate highest.
3. **Assists are weighted by expected shot value.** An assist on a corner three or dunk is more valuable than one on a midrange jumper. Assisted field goals are penalized proportionally, which corrects for biases in systems like RPM that understate offensive rebounding value.
4. **Defensive RAPTOR achieves R² ≈ 0.6 against RAPM, vs. ~0.3 for traditional stats alone.** It relies on opponent shooting data (weighted by shot type), contested rebounding, positional opponent stats, steals (as a proxy for unmeasured activity), and distance traveled for perimeter defenders.
5. **Score effects and team effects adjustments are applied.** Teams play worse with large leads and better when trailing; good teams are therefore underrated by raw stats. The team effects adjustment forces player ratings to sum to the team's overall performance, weighted by usage.
6. **PREDATOR is the predictive variant.** It uses out-of-sample coefficients and is virtually identical to descriptive RAPTOR (0.98 offensive correlation, 0.95 defensive). Projections add biographical priors (age, draft position, height, awards, college strength) and comparable-player adjustments inherited from the CARMELO system.
7. **WAR replacement level is -2.75 per 100 possessions**, derived from two-way contract players. Ratings are positionally even, unlike many other advanced stats.
8. **Approximate RAPTOR extends to 1976-77** using position adjustments and team ratings. Michael Jordan dominates all-time WAR, and the author (Silver) concludes Jordan's peak was probably slightly higher than LeBron's.

## Entities Mentioned

- [[FiveThirtyEight]]
- [[Nate Silver]]
- [[Daniel Myers]]
- [[Ryan Davis]]
- [[James Harden]]
- [[Stephen Curry]]
- [[Kawhi Leonard]]
- [[Paul George]]
- [[Nikola Jokić]]
- [[Joel Embiid]]
- [[Rudy Gobert]]
- [[Michael Jordan]]
- [[LeBron James]]
- [[John Stockton]]
- [[Patrick Ewing]]
- [[DeAndre Jordan]]
- [[Russell Westbrook]]
- [[Chris Paul]]
- [[Anthony Davis]]
- [[Draymond Green]]
- [[Damian Lillard]]
- [[JaVale McGee]]
- [[De'Aaron Fox]]
- [[Brook Lopez]]
- [[Hassan Whiteside]]
- [[Steven Adams]]
- [[Kyle Lowry]]
- [[Ersan İlyasova]]
- [[Marcus Smart]]
- [[Patrick Beverley]]
- [[J.J. Barea]]
- [[Kenneth Faried]]
- [[Mitchell Robinson]]
- [[Avery Bradley]]
- [[Iman Shumpert]]
- [[Monte Morris]]
- [[Jeremias Engelman]]

## Concepts Introduced

- [[RAPTOR]]
- [[PREDATOR]]
- [[Real Adjusted Plus Minus]]
- [[Box Plus/Minus]]
- [[DRAYMOND]]
- [[Plus-Minus Statistics]]
- [[Player Tracking Data]]
- [[Score Effects]]
- [[Replacement Level WAR]]
- [[Approximate RAPTOR]]
- [[CARMELO Projections]]
- [[Pythagorean Expectation]]

## Synthesis Notes

This article is the technical bible for FiveThirtyEight's NBA analytics pipeline and a direct descendant of the sabermetrics tradition. It sits alongside [[Moneyball]] as a case study in applying regression-based player valuation to a new sport, and it connects to [[The Signal and the Noise]] as an expression of Nate Silver's broader philosophy: build transparent, Bayesian-ish models, expose their assumptions, and let the data speak rather than imposing priors.

The tension between descriptive and predictive versions (RAPTOR vs. PREDATOR) mirrors the broader forecasting problem: descriptive accuracy does not guarantee predictive power, and out-of-sample validation is the only honest test. The use of comparable players for projections is a elegant human-in-the-loop hybrid that acknowledges statistical models alone miss contextual career arcs.

**Contradiction / Tension:** RAPTOR's claim that ball-dominant scorers and wings are the most valuable player archetypes implicitly challenges traditional big-man valuation. This creates a philosophical split with older metrics like PER and Win Shares that often overweight volume rebounding and close-range scoring.
