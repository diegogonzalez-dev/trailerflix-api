const { Op } = require('sequelize');
const Contenido = require('../../models/Contenido');
const Categoria = require('../../models/Categoria');
const Genero = require('../../models/Genero');
const Actor = require('../../models/Actor');

module.exports = async (req, res) => {
  try {
    const { nombre } = req.params;

    const contenidos = await Contenido.findAll({
      include: [
        { model: Categoria, as: 'categoria' },
        { model: Genero, as: 'generos', through: { attributes: [] } },
        {
          model: Actor,
          as: 'reparto',
          through: { attributes: [] },
          where: {
            nombre: {
              [Op.like]: `%${nombre}%`
            }
          }
        }
      ]
    });

    if (!contenidos || contenidos.length === 0) {
      return res.status(404).json({ 
        mensaje: `No se encontraron contenidos donde participe un actor que coincida con '${nombre}'.` 
      });
    }

    res.json(contenidos);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};