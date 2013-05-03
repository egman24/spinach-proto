#### Spinach commands

- To run test suite use ```cd /<home directory of the project> && spinach features/<optional specific feature with tab autocomplete>```
- To create step implementation methods run ```spinach --generate```.  New files will be generated in /steps/*

#### TODO

- Create interchangable objects for dependencies and pages -- have the things that are concrete in base object, then have client specific objects to fullfil client specific needs.
  - EX: User has all things shared by users in every project, then UserAHA, UserAmia, UserCardiovillage...etc have all user specific idiosyncracies per platform instance
