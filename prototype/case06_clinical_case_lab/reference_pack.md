# Approved reference pack for the Case 06 prototype

Prepared 2026-09-25. This is a short evidence index for model prompting, not a replacement for a test manual, local policy, or clinician review. Give models only reference material approved for the study.

## ASHA clinical practice resources

- **Speech sound assessment:** ASHA describes comprehensive assessment using standardized and nonstandardized measures; clinicians consider the child's age, linguistic community, language/dialect profile, functioning, and context. Standard scores should not be reported when the norm group is not representative or when the test is modified outside manual rules. [Practice Portal: Speech Sound Disorders—Articulation and Phonology](https://www.asha.org/practice-portal/clinical-topics/articulation-and-phonology/)
- **Assessment selection:** measure choice depends on age, cultural background/values, language profile, suspected condition, and other factors affecting communication. Multiple information sources and contextual observation can contribute to a profile. [Practice Portal: Assessment Tools, Techniques, and Data Sources](https://www.asha.org/practice-portal/resources/assessment-tools-techniques-and-data-sources/)
- **Fluency:** ASHA describes fluency intervention as individualized and based on assessment of speech fluency, language factors, emotional/attitudinal components, and life impact. Treatment goals should be personalized; increasing fluency may not be a person's goal or may be one aspect of a broader approach. [Practice Portal: Stuttering, Cluttering, and Fluency](https://www.asha.org/practice-portal/clinical-topics/fluency-disorders/)
- **Cultural responsiveness:** clinicians consider cultural and linguistic characteristics and individual/family values in assessment and treatment. Ethnicity alone does not establish the language(s) or dialect(s) a person uses. [Practice Portal: Cultural Responsiveness](https://www.asha.org/practice-portal/professional-issues/cultural-responsiveness/)

## CAPCSD clinical education resources

- CAPCSD's clinical-education material frames assessment as serving quality assurance, learner motivation, feedback, communicating expectations, and facilitating learning. Treat this exercise as formative practice and use specific feedback. [Assessing Student Performance](https://www.capcsd.org/assessing-student-performance/)
- CAPCSD's simulation guide supports simulation as an educational method and calls for thoughtful implementation and evaluation. The current prototype is one practice activity; it does not independently establish clinical competence. [Best Practices in Healthcare Simulations: Communication Sciences and Disorders (PDF)](https://www.capcsd.org/assets/pdf/Best-Practices-in-CSD/)

## Test-score references for the candidate issues

- Pearson's CELF-5 guide lists standard score 80 at percentile rank 9 for the relevant Core Language/Index score conversion example. The Case 06 pair “80 / 40” therefore needs checking if 80 is the standard score and 40 is intended as its percentile rank. Confirm test edition, score type, and norm basis before editing the case. [CELF-5 score guide (PDF)](https://www.pearsonassessments.com/content/dam/school/global/clinical/us/assets/celf-5/celf-5-determining-the-severity-of-a-lang-disorder.pdf)
- Pearson's GFTA-3 sample report presents standard scores alongside percentile ranks (for example, SS 76 with PR 5 in the displayed sample). Case 06's SS 70 / PR 30 pair is a candidate inconsistency. Check the actual age/form table; this sample report is not a conversion table for Renata. [GFTA-3 sample score report (PDF)](https://www.pearsonassessments.com/content/dam/school/global/clinical/us/assets/gfta-3/GFTA-3ScoreReport.pdf)
- Pearson describes SSI-4 as a norm-referenced stuttering assessment. Use the SSI-4 manual/protocol and the examinee's age/norm group to determine the correct reported metric and severity. The provided case's field named `standard_score` and its score/percentile/severity combination are only flagged for verification here. [SSI-4 product information](https://www.pearsonclinical.ca/store/caassessments/en_CA/p/P100008257.html)

## Prompting rule

If a reference does not settle the question, label the finding `needs_verification`. Do not ask a model to fill in protected test content or guess a score conversion from a partial case record. Check the appropriate edition's manual under the relevant professional test-use permissions.
