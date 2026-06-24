---
id: 2b7532a5-db8e-4f8a-b2ac-6688d7690c48
title: Semiconductor Scaling
type: concept
created: 2026-06-23
updated: 2026-06-24
tags: [semiconductors, transistors, chip-design, foundry, ai-hardware, nanosheets, stacked-fets, custom-silicon, compilers, runtimes]
source_count: 2
---

# Semiconductor Scaling

Semiconductor scaling is the continued improvement of chip density, performance, power efficiency, and manufacturing capability through transistor architecture, process-node engineering, packaging, and foundry execution. In the AI-infrastructure graph, it is the physical foundation beneath model training, inference, memory bandwidth, and data-center economics.

## Sources

- [2026-06-23: Evening Brief — Tuesday, June 23, 2026](../sources/newsletter-2026-06-23-evening.md) — Samsung demonstrates 3D stacked FETs with triple nanosheet channels at 42nm, showing that transistor geometry remains an active path for extending compute capability.
- [2026-06-24: Evening Brief — Wednesday, June 24, 2026](../sources/newsletter-2026-06-24-evening.md) — OpenAI's Broadcom-built custom chip and Qualcomm's Modular acquisition extend the scaling story from transistor geometry into accelerator specialization and compiler/runtime integration.

## Related Concepts

- [[AI-Augmented Development]]
- [[Cloud & Infrastructure]]
- [[Security & Privacy Toolkit]]

## Notes

The newsletter item is a reminder that AI capability is not just a model-architecture story. Better algorithms still land on silicon, and silicon progress increasingly depends on harder physical tricks: nanosheets, gate-all-around structures, vertical stacking, packaging, thermals, yield, and foundry capital intensity.

The June 24 evening source adds the stack-integration side of scaling. Custom accelerators and compiler/runtime acquisitions are not transistor breakthroughs, but they can still improve effective performance per dollar by matching models, kernels, memory movement, and deployment software more tightly to the hardware.
