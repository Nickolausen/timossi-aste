var config = require("./dbconfig")
const sql = require("mssql")

async function getElencoOpere() {
    try {
        let pool = await sql.connect(config);
        let elenco = await pool.request().query("SELECT * FROM Opere");

        return elenco.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function getOpera(id) {
    try {
        let pool = await sql.connect(config);
        let elenco = await pool.request()
            .input('id_opera', sql.Int, id)
            .query("SELECT * FROM Opere WHERE IDOpera=@id_opera");

        return elenco.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

module.exports = {
    getElencoOpere: getElencoOpere,
    getOpera: getOpera,
}