import React from 'react'
import "./pricelist.css"

function Pricelist({title, prices }) {
  return (
    <>
        <div id='pricelist' className='flex-column pricelist-container'>
        <div class="fieldset-title">
            <span class="legend">{title}</span>
        </div>
        <table>
            {prices.map((item) => {
            return (
            <tr>
                <td>{item.servicename}</td>
                <td className='align-end'>{item.price}</td>
            </tr>
            );
            })}
        </table>
        </div>
    </>
  )
}

export default Pricelist