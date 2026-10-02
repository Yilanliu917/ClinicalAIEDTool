# Case 06: critique and feedback workflow

## Learning task

Give the learner a frozen, fictional case containing plausible documentation and reasoning problems. Ask the learner to:

1. Point to the exact sentence or field that concerns them.
2. Say whether it is contradicted by the case, clinically unsupported, incomplete, or needs verification.
3. Explain the concern and cite a source or assessment principle.
4. Propose a correction, a safer alternative, or the next information they would collect.
5. State their confidence and what would change their conclusion.

This distinction matters: a blank or missing fact is not automatically false, and a line that deserves follow-up is not necessarily an established clinical error.

## Workflow

```text
Synthetic case brief
       ↓
Open-source model generates candidate case → freeze exact text + prompt + model/version
       ↓
Independent first-pass critiques: GPT-5.6sol and the same open-source model
       ↓
Normalize overlapping findings; retain disagreements and confidence
       ↓
Clinician/educator checks every claim against approved sources and the test manual
       ↓
Adjudicated, versioned answer key + case-specific categories
       ↓
Student marks evidence, explains, corrects, and rates confidence
       ↓
Feedback model drafts criterion-based feedback → instructor-approved release
       ↓
Compare model and student results against the adjudicated key
```

Keep the model critiques independent until both first-pass outputs are saved. Do not use a model vote or agreement as ground truth. For a research comparison, preserve the original generations, system prompts, decoding settings, model/version, source pack, timestamps, and all revisions. Score both models against the same adjudicated reference.

Let the *visible* categories be case-specific, as intended. To compare results across cases, optionally keep a separate research-only crosswalk to broad dimensions (assessment validity, clinical reasoning, goal quality, ethics/person-centered practice, documentation/data quality). Students need not see that crosswalk.

## Provisional case-specific answer-key map

These are instructor-facing candidates, not a final clinical key. The actual test manuals and case-generation provenance should be checked before a student is scored. The prototype uses JSON field paths as durable anchors; visible `L###` numbers are generated from a frozen copy and can change if fields are reordered.

| Case category | Anchor(s) | What a strong answer notices | Type and grading note |
|---|---|---|---|
| Score and percentile reporting | `assessment_results[0].standard_score` / `.percentile`; `assessment_results[1].standard_score` / `.percentile` | GFTA-3 70/30 and CELF-5 80/40 appear inconsistent if these fields are standard scores and percentile ranks from the same normed score. Pearson's CELF-5 table maps SS 80 to PR 9. The GFTA-3 publisher sample shows SS 76 at PR 5, so PR 30 for SS 70 also needs correction/verification. Confirm score type, test form/index, age/norm group, and transcription before supplying a replacement. | Likely factual/reporting inconsistency. Accept a student who flags the mismatch and asks to check the correct norm table; do not require memorized percentile conversions. |
| SSI-4 score labeling and severity | `assessment_results[2]` | SSI-4 findings need the documented task/sample and component/total scoring basis. The row calls 60 a `standard_score` and pairs it with PR 20 and “Moderate”; that representation is suspect and needs checking against the age-appropriate SSI-4 manual table. A percentile alone is not a general severity score across different tests. | Needs verification / likely score-format error. Do not grade a precise replacement score as known from this case. |
| Assessment measure versus session probe | `session_notes[0].note`; `session_notes[1].note`; `session_notes[2].note` | “4/10,” “6/10,” and “8/10” look like therapy-trial data but are attributed to GFTA-3 or SSI-4. Those instruments are standardized assessments with defined administration/scoring; a session probe should state its own target, context, denominator, cueing, and scoring rule. | Measurement mismatch. Accept a correction that separates a formal test result from a clinician-designed probe. |
| Speech goal alignment and measurability | `annual_goals[0]` | The brief names /k/ and /t/, while the annual statement only names /k/. The criterion is still `[X/Y trials or X%]`, and GFTA-3 is named as the measure without specifying an appropriately defined goal probe. Ask for baseline, context/position, cueing, criterion, and measure. | Confirmed internal mismatch plus incomplete goal. More than one issue may attach to this anchor. |
| Fluency goal and person-centered fit | `annual_goals[1]`; `session_notes[1].note` | “Maintain eye contact and speak at a normal pace” is not supported by the sparse assessment information and treats eye contact/normalization as the goal. Fluency intervention should be individualized to the child's communication, impact, preferences, and family context; a goal might instead address a child-valued communication strategy or participation outcome, if assessment supports it. | Unsupported / potentially non-person-centered. Do not mark all rate-related goals wrong: the issue is the ungrounded universal target and missing individualized rationale. |
| Language goal and case coherence | `annual_goals[2]`; `assessment_results[1]`; `_metadata.disorders_requested` (instructor-only) | The clinical case assesses/sets a receptive-language target, while the hidden generation request listed expressive language. The goal also retains `[X]` placeholders and does not define which words, contexts, supports, or scoring criteria. The metadata mismatch is a generation-quality check; students should not be graded on it unless metadata is intentionally shown. | Incomplete goal; hidden provenance mismatch. Keep the latter outside the student answer key by default. |
| Missing assessment context | `background`; all assessment rows | Parent concern, teacher concern, reported ethnicity, and scores are not enough to establish a diagnosis or select valid norms. Missing details include language(s)/dialect(s), exposure/use, actual speech/language/fluency samples, assessment form and conditions, functional impact, and family/child perspective. “Hispanic/Latino” alone does not establish Spanish use or invalidate an English test; it signals no language conclusion by itself. | Missing/unsupported, not necessarily false. Credit specific next questions and culturally/linguistically appropriate assessment plans. |
| Data quality / wording | `background` | The final unmatched `}` appears to be a text artifact. It is worth correcting in a cleaned copy, but it is not itself a clinical reasoning error. | Optional documentation/format flag; do not weigh like an unsafe clinical inference. |

## Example correction patterns

These are teaching templates, not clinical recommendations for this fictional child. A learner should fill in the bracketed details from valid assessment data and the applicable course/IEP requirements.

- **Assessment table:** report the exact test edition and index/subtest, score type, score, percentile/interval as appropriate, and norm group from the official report. For the CELF-5 row, if 80 is the applicable standard score, Pearson's guide lists PR 9 for the relevant Core Language/Index score conversion example; verify the actual index and report before changing PR 40. For the other rows, retrieve the original score report rather than inventing replacement values.
- **Session data:** “On a clinician-created probe of /k/ in [word position/context], Renata produced the target accurately in [x/y] opportunities with [cueing level], using [scoring rule].” Report standardized-test results separately according to the manual and local practice.
- **Speech goal:** “Given [context and cueing], Renata will produce [one target, e.g. /k/ in initial position] accurately in [criterion] opportunities across [number] sessions, measured by a defined clinician probe.” Either include /t/ in its own objective or explain from assessment why it is not included. The criterion and context must come from the baseline and educational plan.
- **Fluency goal:** first establish the child's communication experience, family priorities, and functional impact. If the child/family values a fluency-related target, a goal could address [child-selected strategy or self-advocacy] in [meaningful situation] with [criterion]. A goal could also focus on participation or communication confidence when supported by assessment. Eye contact is not a required proxy for success.
- **Language goal:** after evaluating direction following and language needs, define [type/complexity of direction], [routine/context], [visual/repetition supports], and [criterion]. Do not leave `[X]` fields or cite a broad standardized battery as the trial-by-trial measure unless the test/manual and goal actually support that use.
- **Assessment context:** add the languages and dialects used, exposure/use history, representative samples across relevant contexts, test edition/language and any adaptations, functional impact, and child/family perspective. Ethnicity is not a substitute for language history.

## Suggested scoring frame

Use the educator-approved item key and accept equivalent explanations. Do not reward sentence matching alone.

| Dimension | Weight | Observable evidence |
|---|---:|---|
| Detection and localization | 30% | Finds the relevant sentence/field and distinguishes multiple issues on one line. |
| Clinical reasoning and evidence | 30% | Explains why the statement is false, inconsistent, unsupported, or incomplete; uses a relevant source correctly. |
| Correction or next step | 25% | Suggests a defensible correction, or names the data/manual/source needed before making one. |
| Calibration and person-centered judgment | 15% | Separates certainty from suspicion, avoids assumptions from ethnicity, and considers the child's/family's communication priorities. |

Faculty may mark a small set of safety-critical findings as required, but should define those before seeing submissions. Report dimension scores and the specific missed/false-positive issues; avoid a single opaque “clinical competence” number. This one exercise is formative and should not be treated as a stand-alone competency decision.

## Student feedback format

1. **What you caught:** cite their selected anchor and summarize accurate reasoning.
2. **What to revisit:** show an omitted or overcalled issue and distinguish its certainty level.
3. **Why it matters:** connect the finding to assessment validity, treatment relevance, or person-centered care.
4. **A next-step example:** offer one possible revision or data-collection step, with room for more than one correct answer.
5. **Reflection question:** ask what information/source would resolve the remaining uncertainty.

Feedback should be respectful and specific. Avoid telling a learner that a patient has a diagnosis based on this fictional, incomplete file.

## Criteria basis and boundaries

ASHA's Practice Portal describes comprehensive speech sound assessment as combining standardized and nonstandardized information, accounting for the client's language/dialect and whether norms represent that individual, and considering functioning and context. ASHA's fluency guidance says intervention is individualized and that increasing fluency may not be the person's goal or may be one part of a broader approach. CAPCSD's clinical-education materials frame assessment and feedback as part of learning, quality assurance, and learner development. The rubric above is an instructional operationalization of those principles, not an official ASHA or CAPCSD rubric.

- [ASHA: Speech Sound Disorders—Articulation and Phonology](https://www.asha.org/practice-portal/clinical-topics/articulation-and-phonology/)
- [ASHA: Assessment Tools, Techniques, and Data Sources](https://www.asha.org/practice-portal/resources/assessment-tools-techniques-and-data-sources/)
- [ASHA: Stuttering, Cluttering, and Fluency](https://www.asha.org/practice-portal/clinical-topics/fluency-disorders/)
- [ASHA: Cultural Responsiveness](https://www.asha.org/practice-portal/professional-issues/cultural-responsiveness/)
- [CAPCSD: Assessing Student Performance](https://www.capcsd.org/assessing-student-performance/)
- [CAPCSD: Best Practices in Healthcare Simulations—Communication Sciences and Disorders (PDF)](https://www.capcsd.org/assets/pdf/Best-Practices-in-CSD/)
- [Pearson: CELF-5 severity/score guide (PDF)](https://www.pearsonassessments.com/content/dam/school/global/clinical/us/assets/celf-5/celf-5-determining-the-severity-of-a-lang-disorder.pdf)
- [Pearson: GFTA-3 sample score report (PDF)](https://www.pearsonassessments.com/content/dam/school/global/clinical/us/assets/gfta-3/GFTA-3ScoreReport.pdf)
- [Pearson: SSI-4 product information](https://www.pearsonclinical.ca/store/caassessments/en_CA/p/P100008257.html)

The score examples above should be checked in the correct instrument edition/manual and applicable norm group before turning this draft into an answer key.
