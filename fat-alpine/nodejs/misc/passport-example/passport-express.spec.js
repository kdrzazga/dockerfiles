const chai = require('chai');
const chaiHttp = require('chai-http');
const app = require('./passport-express.spec.js'); // Replace with the path to your app file

// Configure Chai
chai.use(chaiHttp);
const expect = chai.expect;

describe('Authentication', () => {
  // Test successful login
  describe('POST /login', () => {
    it('should log in with valid credentials', (done) => {
      chai
        .request(app)
        .post('/login')
        .send({ username: 'admin', password: 'admin' })
        .end((err, res) => {
          expect(err).to.be.null;
          expect(res).to.have.status(302);
          expect(res).to.redirectTo('/dashboard');
          done();
        });
    });
  });

  // Test failed login
  describe('POST /login', () => {
    it('should reject invalid credentials', (done) => {
      chai
        .request(app)
        .post('/login')
        .send({ username: 'invalid', password: 'invalid' })
        .end((err, res) => {
          expect(err).to.be.null;
          expect(res).to.have.status(302);
          expect(res).to.redirectTo('/login');
          done();
        });
    });
  });

  // Test authenticated access to the dashboard
  describe('GET /dashboard', () => {
    it('should allow access to the dashboard if authenticated', (done) => {
      chai
        .request(app)
        .get('/dashboard')
        .end((err, res) => {
          expect(err).to.be.null;
          expect(res).to.have.status(200);
          expect(res.text).to.include('Welcome to the dashboard');
          done();
        });
    });
  });

  // Test unauthenticated access to the dashboard
  describe('GET /dashboard', () => {
    it('should redirect to login if not authenticated', (done) => {
      chai
        .request(app)
        .get('/dashboard')
        .end((err, res) => {
          expect(err).to.be.null;
          expect(res).to.have.status(302);
          expect(res).to.redirectTo('/login');
          done();
        });
    });
  });
});
