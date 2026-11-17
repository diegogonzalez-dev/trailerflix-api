const { DataTypes } = require('sequelize');
const sequelize = require('../database')

const Contenido = sequelize.define('Contenido', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  titulo: {
    type: DataTypes.STRING,
    allowNull: false
  },
  sinopsis: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  temporadas: {
    type: DataTypes.STRING,
    defaultValue: 'N/A'
  },
  trailer: {
    type: DataTypes.STRING,
    allowNull: true
  },
  reproducciones: {
    type: DataTypes.INTEGER,
    defaultValue: 0
  },
  categoria_id: {
    type: DataTypes.INTEGER,
    allowNull: false
  }
}, {
  tableName: 'contenidos',
  timestamps: false
});

module.exports = Contenido;