import React from 'react'
import { Services } from '../../../assets/Services'
import "./servicecards.css"
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import Slider from 'react-slick';
import { Link } from 'react-router-dom';

function Servicecards({serviceheader}) {
    var settings = {
        dots: true,
        infinite: false,
        speed: 500,
        slidesToShow: 4,
        slidesToScroll: 1,
        responsive: [
            {
              breakpoint: 1024,
              settings: {
                slidesToShow: 3,
                slidesToScroll: 1,
              }
            },
            {
              breakpoint: 890,
              settings: {
                slidesToShow: 2,
                slidesToScroll: 1,
              }
            },
            {
              breakpoint: 668,
              settings: {
                slidesToShow: 1,
                slidesToScroll: 1,
              }
            }
          ]
      };
  return (
    <>
        <div id='sc-cntr' className="max-w-6xl mx-auto px-4">
            <h4>{serviceheader}</h4>
            <div className='sc-container'>
            <Slider {...settings}>{Services.map((item) => {
                return (
                    <Link to={"tietoja?service=" + item.path}>
                      <div key={item.id} id='sc-item'>
                          <img className='sc-img-window-style' src={process.env.PUBLIC_URL + "/images/" + item.image} alt={item.imagealt} />
                          <h4>{item.servicename}</h4>
                          <p>{item.about.length > 53 ? item.about.slice(0, 50).trim() + '...' : item.about}</p>
                      </div>
                    </Link>
                );
            })}
            </Slider>
            
            </div>
        </div>
    </>
  )
}

export default Servicecards