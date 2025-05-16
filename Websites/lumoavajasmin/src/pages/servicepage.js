import React, { useEffect, useState } from 'react'
import Smallheader from '../components/ui/header/smallheader'
import Textheader from '../components/ui/header/textheader'
import Navbar from '../components/ui/navigation/navbar'
import Footer from "../components/ui/footer/footer";
import { Services } from '../assets/Services';
import { useSearchParams } from 'react-router-dom';
import Threecolumntextbox from '../components/ui/threecolumntextbox/threecolumntextbox';

function Servicepage() {
  const [searchParams] = useSearchParams();
  const [serviceContent, setServiceContent] = useState(null);

  useEffect(() => {
    const serviceParam = searchParams.get("service");

    if (serviceParam) {
      const matchedService = Services.find(service => service.path === serviceParam);
      if (matchedService) {
        setServiceContent(matchedService);
      }
    }
    console.log(searchParams);
  }, [searchParams]);

  return (
    <>
      <Navbar/>
      <Smallheader image={"etusivuheader.jpg"} text={serviceContent && (serviceContent.about.length > 36 ? serviceContent.about.slice(0, 33).trim() + '...' : serviceContent.about) || "303: Ei tuloksia"} imagealt={"Header image"} />
      <Textheader headertext={serviceContent && serviceContent.servicename} smalltext={"Tietoja"} />
      {serviceContent ? (
        <Threecolumntextbox 
          text1={serviceContent.about} 
          text2={serviceContent.about2} 
          text3={serviceContent.about3} 
          image1={serviceContent.image} 
          image2={serviceContent.image2} 
          image3={serviceContent.image3} 
          imagealt1={serviceContent.imagealt}
          imagealt2={serviceContent.imagealt2}
          imagealt3={serviceContent.imagealt3}
        />
      ) : (
        <p>Service not found.</p> // If no matching service
      )}
      <Footer 
        fullname={"Jasmin Laakkonen"} 
        bnumb={"Ytunnus"} 
        mail={"lumoava.jasmin@gmail.com"} 
        phon={"+358XX-XXX-XXXX"} 
        postalxCity={"80100 Joensuu"} 
        street={"Jukolankatu 19"} 
      />
    </>
  );
}

export default Servicepage