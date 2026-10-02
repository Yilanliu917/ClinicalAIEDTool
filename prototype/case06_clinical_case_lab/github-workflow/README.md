# GitHub upload and update workflow

Repository: https://github.com/Yilanliu917/ClinicalAIEDTool
Upload branch: hiro/import-project
Pull request base: main

## First upload

1. Install Git for Windows and make sure PowerShell can run git.
2. Clone the repository and create the review branch:

   git clone https://github.com/Yilanliu917/ClinicalAIEDTool.git
   cd ClinicalAIEDTool
   git switch -c hiro/import-project

3. Copy the contents of this project folder into the cloned repository. Do not copy the old project's .git folder.
4. Exclude .env files, credentials, patient or student information, PHI or PII, node_modules, build outputs, caches, and temporary files. This project labels its case fictional, but it includes a full name and dated clinical-session notes; replace those with synthetic or generalized values before uploading if they could identify a real person.
5. From the cloned repository root, review and push with:

   .\github-workflow\push-update.ps1 -Message "Import clinical case lab"

The script stages changes, displays the complete staged diff, requires you to type PUSH after review, commits to hiro/import-project, and pushes that branch. It refuses to run if excluded file types are present or if origin points to a different repository.

## Later updates

Make changes in the cloned ClinicalAIEDTool working copy, stay on hiro/import-project, and run the same script with a descriptive commit message. Review every staged change before confirming.

## Pull request

After pushing, open a pull request from hiro/import-project into main:

https://github.com/Yilanliu917/ClinicalAIEDTool/compare/main...hiro/import-project

Do not push directly to main or merge before review.
