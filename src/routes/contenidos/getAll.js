const Contenido = require('../../models/Contenido');
const Categoria = require('../../models/Categoria');
const Genero = require('../../models/Genero');
const Actor = require('../../models/Actor');

module.exports = async (req, res) => {
  try {
    const contenidos = await Contenido.findAll({
      include: [
        { model: Categoria, as: 'categoria' },
        { model: Genero, as: 'generos', through: { attributes: [] } },
        { model: Actor, as: 'reparto', through: { attributes: [] } }
      ]
    });
    res.json(contenidos);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};