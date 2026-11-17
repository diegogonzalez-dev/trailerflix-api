const Contenido = require('../../models/Contenido');

module.exports = async (req, res) => {
  try {
    const { id } = req.params;
    const [updated] = await Contenido.update(req.body, {
      where: { id }
    });

    if (!updated) {
      return res.status(404).json({ error: 'Contenido no encontrado para actualizar' });
    }

    const contenidoActualizado = await Contenido.findByPk(id);
    res.json({
      mensaje: 'Contenido actualizado con éxito',
      contenido: contenidoActualizado
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};