# Backend Challenge

## Up and running

Download or clone the repo and run the commands below in the console:

```bash
$ rails db:create db:migrate db:seed
$ bundle exec rails s
```

If at any time JS is used via Webpacker, run the following command in another console:

```bash
$ ./bin/webpack-dev-server
```

Open the browser and visit [http://localhost:3000](http://localhost:3000).

The app uses latest Ruby and Rails versions.

## Decisions

From the very beginning, it seemed clear to me that an authentication system would be necessary for teachers, although the requirements specify that it was not required. I suppose it could be considered as "functional doubt not adequately described".

If the teacher is authenticated, we can easily guarantee their identity, thus being able to enroll in as many courses as they want and we can control their votes to teachers and courses.

The summary of the features currently included are:

- Guest users (those unauthenticated) can register as a teacher, log in and view the enrollments, courses, and teachers listings with their respective number of votes.

- For the registration of a teacher only an email and a password are required. Once users provide that data, they are automatically logged in. I haven't configured other authentication features such as email confirmation, remember password, etc.

- Authenticated users can see the same that unauthenticated users do, as well as being able to enroll in courses, add new courses, and vote for teachers and courses.

- I decided to only give positive votes.

- Teachers can vote for themselves and other teachers, in addition to existing courses, but only once for each. If you try to vote a second time for the same teacher or course, a warning message will be displayed.

- An enrollment is created for the current teacher and the selected course. The same teacher cannot enroll twice in the same course.

- Regarding the votes, the enrollments listing only shows the number of votes for the course and the teacher. To vote, the teacher must go to the courses or teachers listing, respectively.

- Two teachers cannot have the same email.

- Two courses cannot have the same title.

- Of all Rails CRUD actions, I've implemented only the index and new/create where applicable.

## Design patterns

In this project where there is little complexity and few entities, some patterns that I use regularly are clearly unnecessary or some could even be said to be over-engineering, such as presenters, service objects or query objects; but still I want to show the use of some of them:

- **Façade**: for `index` actions in the controllers. That way we expose a single instance variable to the view. I call them dashboards, following the example of [thoughtbot](https://thoughtbot.com/blog/sandi-metz-rules-for-developers#only-instantiate-one-object-in-the-controller). I could have perfectly used a scope instead, as these dashboards only include single-line methods, but once again the idea was to show the pattern in use. These dashboards are also used in the enrollment form object as default keyword arguments, where they can be overriden using dependency injection.

- **Form object**: for `new` and `create` actions in this case, usually also for `edit` and `update` actions when needed. Instead of using gems that provide similar functionality, I've been making use of custom objects inspired by (read: stolen from) [this post](http://stratus3d.com/blog/2015/04/04/extensible-rails-4-form-object-design/).

## Testing

I normally use the [Four-Phase Test pattern](https://thoughtbot.com/blog/four-phase-test) to organize code in tests, except for the teardown phase, which is not usually explicitly required.

I also find it very useful in tests to follow a [WET (Write Everything Twice)](https://thoughtbot.com/blog/the-case-for-wet-tests) approach instead of the famous DRY (Don't Repeat Yourself) for everything, thus avoiding the appearance of mystery guests, among other things. In this project I use both approaches, depending on the complexity of the test itself.

This project has a coverage greater than 99%, according to [SimpleCov](https://github.com/simplecov-ruby/simplecov), although I am not a big fan of this type of tool, since it doesn't mean that the code is well tested.

There are some tests that I haven't added that could increase the trust in the coverage:

- In the process of sign up as teacher, log in and log out we could check the user is redirected to expected path, the expected flash message is displayed, etc.

- In request tests we could check that unauthenticated teachers are not able to perfom any action requiring an authenticated teacher. At the moment, I just check that everything works fine when the teacher is logged in, the happy path.

I've added a couple of acceptance tests checking that users can see what is expected, depending on whether they are logged in or not.

After each push to the `main` branch, a build is triggered on Travis CI.

## Code

I've used the provided Rubocop configuration to write the code. The only changes added to that file are:

- Capybara aliases for feature specs have been enabled: feature, background, given, etc.
- Files `lib/tasks/*` and `Guardfile` have been excluded from some specific cops.

Currently in the code there is no offense detected.

I've added little documentation in this code, because I prefer self-documenting code, with good variable, method and class names. However, if the team prefers to have everything documented or if it is necessary to document the reason for a given change, I usually use [YARD](https://yardoc.org/). There are examples of that documentation in form objects.

## Version control

In this project I haven't used branches. Usually the approach I follow is similar to the one proposed by [gitflow](https://nvie.com/posts/a-successful-git-branching-model/). Besides the typical GitHub workflow of pull requests and code reviews before merging the changes.

Regarding commits, I follow the recommendations of [Tim Pope's famous post](https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html) and [thoughtbot](https://thoughtbot.com/blog/5-useful-tips-for-a-better-commit-message). I also include the references that have helped me to develop a given feature.

In this case, there is no commit that needed much explanation.

## Performance

- Use of [Bullet](https://github.com/flyerhzm/bullet) gem to avoid N + 1 queries, among other things.
- Use of counter cache to keep track of resources' votes, as suggested by the gem [acts_as_votable](https://github.com/ryanto/acts_as_votable#caching).
- Use of indexes in the database tables for the columns usually used in queries.

## TODO

- I haven't added a single JS line. For example, buttons meant to vote for teachers or courses could use UJS to avoid a full page reload or hide them once the teacher votes for a given resource.
- Gracefully handle unverified requests.
- Extract duplication from form objects.
- Extract duplicated markup to display resources' votes.
- Import only needed modules from Semantic UI.
- Change the database for production environment. In development and test environments SQLite is used.
- Deploy to production.
