alias Chat.Repo
alias Chat.Directory.User
Repo.insert! %User{username: "User 1", email: "user_1@email.com", password: "123456789"}
Repo.insert! %User{username: "User 2", email: "user_2@email.com", password: "123456789"}
Repo.insert! %User{username: "User 3", email: "user_3@email.com", password: "123456789"}
