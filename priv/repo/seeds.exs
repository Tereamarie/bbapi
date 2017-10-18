alias BbApi.Repo
alias BbApi.Characters.Character

Repo.insert!(%Character{name: "Bob Belcher", profession: "Owner", sex: "male", voiced_by: "H. Jon Benjamin"})
Repo.insert!(%Character{name: "Linda Belcher", profession: "Bookkeeper", sex: "female", voiced_by: "John Roberts"})
Repo.insert!(%Character{name: "Tina Belcher", profession: "Author", sex: "female", voiced_by: "Dan Mintz"})
Repo.insert!(%Character{name: "Gene Belcher", profession: "Musician", sex: "male", voiced_by: "Eugene Mirman"})
Repo.insert!(%Character{name: "Louise Belcher", profession: "", sex: "female", voiced_by: "Kristen Schaal"})
