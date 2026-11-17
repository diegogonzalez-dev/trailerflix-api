const { Router } = require('express');
const router = Router();

const getAll = require('./contenidos/getAll');
const getTop10 = require('./contenidos/getTop10');
const getByActor = require('./contenidos/getByActor');
const getByTitle = require('./contenidos/getByTitle');
const getByCountry = require('./contenidos/getByCountry');
const getById = require('./contenidos/getById');
const create = require('./contenidos/create');
const update = require('./contenidos/update');
const remove = require('./contenidos/delete');

router.get('/', (req, res) => {
  res.send(`
    <h1 style="color: #E50914; text-align: center; font-family: Arial, sans-serif; margin-top: 30px;">
      ¡Bienvenido a Trailerflix!
    </h1>
  `);
});
router.get('/api/contenidos', getAll);
router.get('/api/contenidos/top10', getTop10);
router.get('/api/contenidos/actor/:nombre', getByActor);
router.get('/api/contenidos/titulo/:titulo', getByTitle);
router.get('/api/contenidos/pais/:pais', getByCountry);
router.get('/api/contenidos/:id', getById);
router.post('/api/contenidos', create);
router.put('/api/contenidos/:id', update);
router.delete('/api/contenidos/:id', remove);

module.exports = router;