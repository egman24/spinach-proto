#### Spinach generation commands

- To create step implementation methods run ```spinach --generate```.  New files will be generated in /steps/*

#### Spinach test suite commands

- To run test suite use ```cd /<home directory of the project> && spinach features/<optional specific feature with tab autocomplete>```

#### Report parser commands

- To run the report parser use ```cd /<home directory of the project>/report/report_parser/ && ruby report_parser.rb```

#### TODO
- Build rake task to create necessary file structure that is not brought down with the git pull: report, report/images, report/images/screenshots, tmp, etc...
- Build rake task to clean out the tmp directory OR to archive the tmp directory in zip and decide where to move it
- Create interchangable objects for dependencies and pages -- have the things that are concrete in base object, then have client specific objects to fullfil client specific needs.
  - EX: User has all things shared by users in every project, then UserAHA, UserAmia, UserCardiovillage...etc have all user specific idiosyncracies per platform instance


#### Test ideas

* Email verification after all email jobs (cron reminders, user action, etc.) -- have tests inline with the feature actions, but add tag for '@email' and dont normally run these?
  - Figure out how to best test this (use dispostable?, check the log record of emails sent, etc?)

```
# USER REGISTRATION

  step 'I should have received a welcome email' do
    pending 'Should this be seperate test? if so how can i reference that this is part of the registration cascade'
  end

```