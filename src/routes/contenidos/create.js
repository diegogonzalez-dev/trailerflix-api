const Contenido = require('../../models/Contenido');

module.exports = async (req, res) => {
  try {
    const nuevoContenido = await Contenido.create(req.body);
    res.status(201).json({
      mensaje: 'Contenido creado con éxito',
      contenido: nuevoContenido
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};