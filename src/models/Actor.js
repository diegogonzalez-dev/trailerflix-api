const { DataTypes } = require('sequelize');
const sequelize = require('../database');

const Actor = sequelize.define('Actor', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  nombre: {
    type: DataTypes.STRING,
    allowNull: false
  },
  pais_id: {
    type: DataTypes.INTEGER,
    allowNull: false
  }
}, {
  tableName: 'actores',
  timestamps: false
});

module.exports = Actor;