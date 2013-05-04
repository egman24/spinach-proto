#### Spinach commands

- To run test suite use ```cd /<home directory of the project> && spinach features/<optional specific feature with tab autocomplete>```
- To create step implementation methods run ```spinach --generate```.  New files will be generated in /steps/*

#### TODO
- Build rake task to create necessary file structure that is not brought down with the git pull: report, report/images, report/images/screenshots, tmp, etc...
- Build rake task to clean out the tmp directory OR to archive the tmp directory in zip and decide where to move it
- Create interchangable objects for dependencies and pages -- have the things that are concrete in base object, then have client specific objects to fullfil client specific needs.
  - EX: User has all things shared by users in every project, then UserAHA, UserAmia, UserCardiovillage...etc have all user specific idiosyncracies per platform instance
