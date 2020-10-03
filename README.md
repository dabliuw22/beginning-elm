# Elm

1. Init Elm project:
    `elm init`

2. Elm Repl:
    `elm repl`

3. `.elm` to `.js`:
    `elm make src/HomePage.elm --output elm.js`
    `elm make src/Signup.elm --output signup.js`
    `elm make src/SignupWithBootstrap.elm --output signup_bootstrap.js`

4. Install dependency:
    `elm install elm/http`
    `elm install rtfeldman/elm-css`
    `elm intall elm/random`

5. Build with server -> http://localhost:8000:
    `elm reactor`

6. Test:
    `npm install elm-test -g`
    `elm-test init`

7. Run Test: `elm-test`