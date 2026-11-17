const express = require('express');
require('dotenv').config({ path: __dirname + '/../.env' });
const routes = require('./routes/index');


require('./database');
const Categoria = require('./models/Categoria');
const Genero = require('./models/Genero');
const Pais = require('./models/Pais');
const Actor = require('./models/Actor');
const Contenido = require('./models/Contenido');

// Definir las Relaciones
Contenido.belongsTo(Categoria, { foreignKey: 'categoria_id', as: 'categoria' });
Categoria.hasMany(Contenido, { foreignKey: 'categoria_id', as: 'contenidos' });

Actor.belongsTo(Pais, { foreignKey: 'pais_id', as: 'pais' });
Pais.hasMany(Actor, { foreignKey: 'pais_id', as: 'actores' });

Contenido.belongsToMany(Genero, { through: 'contenido_genero', foreignKey: 'contenido_id', otherKey: 'genero_id', timestamps: false, as: 'generos' });
Genero.belongsToMany(Contenido, { through: 'contenido_genero', foreignKey: 'genero_id', otherKey: 'contenido_id', timestamps: false, as: 'contenidos' });

Contenido.belongsToMany(Actor, { through: 'contenido_actor', foreignKey: 'contenido_id', otherKey: 'actor_id', timestamps: false, as: 'reparto' });
Actor.belongsToMany(Contenido, { through: 'contenido_actor', foreignKey: 'actor_id', otherKey: 'contenido_id', timestamps: false, as: 'peliculas_series' });

const app = express();
app.use(express.json());

app.use('/', routes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});