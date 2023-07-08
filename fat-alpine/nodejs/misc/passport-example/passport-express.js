// curl -X POST -d "username=admin&password=admin" http://localhost:3000/login

const express = require('express');
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

// Create an Express application
const app = express();

// Configure Passport
passport.use(new LocalStrategy(
  function(username, password, done) {
    if (username === 'admin' && password === 'admin') {
      return done(null, { username: 'admin' });
    } else {
      return done(null, false, { message: 'Invalid credentials' });
    }
  }
));

// Serialize and deserialize user
passport.serializeUser(function(user, done) {
  done(null, user.username);
});

passport.deserializeUser(function(username, done) {
  done(null, { username: 'admin' });
});

// Set up Express middleware
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(require('express-session')({
  secret: 'secret-key',
  resave: false,
  saveUninitialized: false
}));
app.use(passport.initialize());
app.use(passport.session());

// Define routes
app.post('/login', passport.authenticate('local', {
  successRedirect: '/dashboard',
  failureRedirect: '/login',
  failureFlash: true
}));

app.get('/dashboard', isAuthenticated, function(req, res) {
  res.send('Welcome to the dashboard, ' + req.user.username);
});

app.get('/login', function(req, res) {
  res.send('Please login');
});

// Middleware to check if user is authenticated
function isAuthenticated(req, res, next) {
  if (req.isAuthenticated()) {
    return next();
  }
  res.redirect('/login');
}

// Start the server
app.listen(3004, function() {
  console.log('Server started on port 3004');
});
