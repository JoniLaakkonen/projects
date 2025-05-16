import React from 'react'
import './threecolumntextbox.css'

function Threecolumntextbox({text1, text2, text3, image1, image2, image3, imagealt1, imagealt2, imagealt3}) {
  return (
    <>
    <div className='service-cntr flex-column'>
      {text1 && 
        <div className='bubble nd'>
          <p>
            {text1.split('<br />').map((line, idx) => (
              <React.Fragment key={idx}>
                {line}<br />
              </React.Fragment>
            ))}
          </p>
          {image1 && 
          <aside>
            <img 
            src={process.env.PUBLIC_URL + "/images/" + image1}
            alt={imagealt1}
            className="tctb-img float-left"/>
          </aside>
          }
        </div>
      }
      {text2 && 
      <div className='bubble nd'>
        <p>
          {text2.split('<br />').map((line, idx) => (
            <React.Fragment key={idx}>
              {line}<br />
            </React.Fragment>
          ))}
        </p>
        {image2 && 
        <aside>
          <img 
          src={process.env.PUBLIC_URL + "/images/" + image2}
          alt={imagealt2}
          className="tctb-img float-left"/>
        </aside>
        }
      </div>
      }
      {text3 && 
        <div className='bubble nd'>
          <p>
            {text3.split('<br />').map((line, idx) => (
              <React.Fragment key={idx}>
                {line}<br />
              </React.Fragment>
            ))}
          </p>
          {image3 && 
          <aside>
            <img 
            src={process.env.PUBLIC_URL + "/images/" + image3}
            alt={imagealt3}
            className="tctb-img float-left"/>
          </aside>
          }
        </div>
      }
    </div>
    </>
  )
}

export default Threecolumntextbox