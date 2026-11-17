const Contenido = require('../../models/Contenido');

module.exports = async (req, res) => {
  try {
    const { id } = req.params;
    const deleted = await Contenido.destroy({
      where: { id }
    });

    if (!deleted) {
      return res.status(404).json({ error: 'Contenido no encontrado para eliminar' });
    }

    res.json({ mensaje: 'Contenido eliminado con éxito' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};