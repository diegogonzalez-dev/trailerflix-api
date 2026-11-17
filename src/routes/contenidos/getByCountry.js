const { Op } = require('sequelize');
const Contenido = require('../../models/Contenido');
const Categoria = require('../../models/Categoria');
const Genero = require('../../models/Genero');
const Actor = require('../../models/Actor');
const Pais = require('../../models/Pais');

module.exports = async (req, res) => {
  try {
    const { pais } = req.params;

    const contenidos = await Contenido.findAll({
      include: [
        { model: Categoria, as: 'categoria' },
        { model: Genero, as: 'generos', through: { attributes: [] } },
        {
          model: Actor,
          as: 'reparto',
          through: { attributes: [] },
          required: true,
          include: [
            {
              model: Pais,
              as: 'pais',
              where: {
                nombre: {
                  [Op.like]: `%${pais}%`
                }
              }
            }
          ]
        }
      ]
    });

    if (!contenidos || contenidos.length === 0) {
      return res.status(404).json({
        mensaje: `No se encontraron contenidos con actores de un país que coincida con '${pais}'.`
      });
    }

    res.json(contenidos);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};