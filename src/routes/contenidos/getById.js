const Contenido = require('../../models/Contenido');
const Categoria = require('../../models/Categoria');
const Genero = require('../../models/Genero');
const Actor = require('../../models/Actor');

module.exports = async (req, res) => {
  try {
    const contenido = await Contenido.findByPk(req.params.id, {
      include: [
        { model: Categoria, as: 'categoria' },
        { model: Genero, as: 'generos', through: { attributes: [] } },
        { model: Actor, as: 'reparto', through: { attributes: [] } }
      ]
    });

    if (!contenido) {
      return res.status(404).json({ error: 'Contenido no encontrado' });
    }

    res.json(contenido);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};