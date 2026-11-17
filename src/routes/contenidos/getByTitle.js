const { Op } = require('sequelize');
const Contenido = require('../../models/Contenido');
const Categoria = require('../../models/Categoria');
const Genero = require('../../models/Genero');
const Actor = require('../../models/Actor');

module.exports = async (req, res) => {
  try {
    const { titulo } = req.params;

    const contenidos = await Contenido.findAll({
      where: {
        titulo: {
          [Op.like]: `%${titulo}%` // Búsqueda parcial, insensible a mayúsculas/minúsculas y acentos
        }
      },
      include: [
        { model: Categoria, as: 'categoria' },
        { model: Genero, as: 'generos', through: { attributes: [] } },
        { model: Actor, as: 'reparto', through: { attributes: [] } }
      ]
    });

    // Validamos si no se encontraron resultados
    if (!contenidos || contenidos.length === 0) {
      return res.status(404).json({ 
        mensaje: `No se encontraron contenidos que coincidan con '${titulo}'.` 
      });
    }

    res.json(contenidos);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};