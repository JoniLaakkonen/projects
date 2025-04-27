import React from 'react'

function Textheader({headertext, smalltext}) {
  return (
    <>
        <div id='textheader' className='flex-column text-header-container'>
            <div class="fieldset-title">
                <span class="legend">{smalltext}</span>
            </div>
            <h1>{headertext}</h1>
        </div>
    </>
  )
}

export default Textheader