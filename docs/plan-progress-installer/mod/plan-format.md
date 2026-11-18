# How a plan is split

The Progress view is built from the plan's markdown. The mod does not ask Claude for a structure; it reads headings and bullets. Knowing the rules lets you ask for plans that split well.

## Phases come from headings

**When some heading names a unit of work, only those headings open phases.** A heading names a unit of work when it reads like `Phase 2: …`, `Stage …`, `Milestone …`, `Step 3` or a numbered title such as `1. Setup`. In such a plan:

- deeper headings inside a phase fold into it;
- other sections, such as Context or Verification, are not counted.

**Otherwise every heading opens a phase,** except note sections: Context, Background, Goals, Notes, Open questions, Risks and the like.

A leading top-level heading is taken as the plan's title, not as a phase.

## Steps come from bullets

- A step is a bullet at the section's outermost indent.
- Nested bullets are details of the step above them, not steps.
- Bullets inside code fences are ignored.
- A checkbox bullet, `- [ ]` or `- [x]`, is a step whose state the plan itself sets.

## An example

```markdown
# Add rate limiting

## Context
The API has no limits today.

## Phase 1: Storage
- Add a `rate_limits` table
  - columns: key, window, count
- Add the repository

## Phase 2: Middleware
- Count requests per key
- Return 429 over the limit

## Verification
- Run the load test
```

is split into:

| Phase | Steps |
|---|---|
| 1. Storage | 1.1 Add a `rate_limits` table · 1.2 Add the repository |
| 2. Middleware | 2.1 Count requests per key · 2.2 Return 429 over the limit |

*Context* and *Verification* are not phases, because two headings name a unit of work and only those count. The nested bullet about columns is a detail of step 1.1. The whole plan, with those sections, is still in the Plan view.

## Checkboxes change what is counted

A plan with at least one checkbox counts only its checkboxes. A plan with none counts every step. So in a plan where the real work is a checklist and the other bullets are remarks, write the work as `- [ ]` items and the percentage follows the checklist alone.

## Writing plans that split well

| Do | Why |
|---|---|
| Name phases `Phase 1: …`, `Phase 2: …` | Only they become phases; notes stay out of the count |
| One bullet per piece of work | Each becomes a step with an id |
| Put details in nested bullets | They stay with their step and are not counted |
| Keep a step's wording stable | Marks are kept by step text |
| Keep commands in code fences | Bullets in fences are not mistaken for steps |

You can say so once in your instructions for Claude, for example: "In plans, split the work into phases named `Phase N: …`, one bullet per step."
