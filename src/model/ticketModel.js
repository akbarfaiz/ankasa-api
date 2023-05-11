const Pool = require('../config/db')

const selectTicket = () => {
    return Pool.query(
        `
        SELECT
            t.id as ticket_id, t.plane_id,
            t.takeoff, t.landing, t.transit, t.price, t.duration, p.name as plane_name, t.class, t.terminal, t.gate, 
            a1.name as origin_name, a1.city as origin_city, a1.country as origin_country, a1.airport_code as origin_code,
            a2.name as destination_name, a2.city as destination_city, a2.country as destination_country, a2.airport_code as destination_code
        FROM 
            ticket as t
        JOIN
            plane as p ON p.id = t.plane_id
        JOIN
            airport as a1 ON a1.id = t.origin
        JOIN
            airport as a2 ON a2.id = t.destination
        `
    );
};

const selectTicketById = (id) => {
    return Pool.query(
        `
        SELECT
            t.id as ticket_id, t.plane_id,
            t.takeoff, t.landing, t.transit, t.price, t.duration, p.name as plane_name, t.class, t.terminal, t.gate,
            a1.name as origin_name, a1.city as origin_city, a1.country as origin_country, a1.airport_code as origin_code,
            a2.name as destination_name, a2.city as destination_city, a2.country as destination_country, a2.airport_code as destination_code
        FROM 
            ticket as t
        JOIN
            plane as p ON p.id = t.plane_id
        JOIN
            airport as a1 ON a1.id = t.origin
        JOIN
            airport as a2 ON a2.id = t.destination
        WHERE
            t.id = '${id}'
        `
    );
};

const insertTicket = data => {
    const {id,plane_id,origin,destination,takeoff,landing,transit,price,duration} = data
    return new Promise((resolve,reject)=>
    Pool.query(`INSERT INTO ticket(id,plane_id,origin,destination,takeoff,landing,transit,price,duration) VALUES('${id}',${plane_id},${origin},${destination},TO_TIMESTAMP('${takeoff}', 'DD-MM-YYYY HH24:MI'),TO_TIMESTAMP('${landing}', 'DD-MM-YYYY HH24:MI'),${transit},${price},'${duration}');`,(err,result)=>{
        if(!err){
        resolve(result)
        } else {
        reject(err)
        }
    }))
};

module.exports = {selectTicket, selectTicketById, insertTicket}