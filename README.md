# Bob's Burgers API

I wanted to practice building an API with Phoenix. Inspired by
https://swapi.com, I decided to make my API based off Bob's Burgers.

## Structure
There will be GET endpoints to retrieve any of the data. There will also be
endpoints for creating, editing, and deleting resources. However, these will
require an API key.

## Things to do
- [ ] Build homepage
- [ ] Build about page
- [ ] Build documentation page
- [ ] Add characters
- [ ] Add opening gag businesses
- [ ] Add opening pest control van names
- [ ] Add burger specials
- [ ] Add episode names

## Misc info
- Characters
  - Name
  - Sex
  - Profession
  - Voice by
  - Episodes (association)

- Episodes
  - Name
  - Air date
  - Season
  - Season Episode
  - Total Episode
  - Characters (association)
  - Business gag (association)
  - Pest Control van (association)
  - Burger specials (association)

- Business gag
  - Name
  - Episode (association)

- Pest control van
  - Name
  - Episode (association)

- Burger special
  - Name
  - Episode (association)
