using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Serialization;

namespace JBecerraExamenGrupoReforma
{
    class DatosXML
    {
        public static noticias DesarializarXML()
        {
            noticias noticias = new noticias();
            string path = @"C:\Users\ALIEN11\Documents\Jose Ramon Becerra Perez\JBecerraExamenGrupoReforma\DatosXML.xml";

            using (TextReader reader = new StreamReader(path))
            {
                XmlSerializer serializer = new XmlSerializer(typeof(noticias));
                noticias = (noticias)serializer.Deserialize(reader);
            }
            SerialziarXML(noticias);
            return noticias;
        }
        public static void SerialziarXML(noticias noticias)
        {
            info info = new info();
            int arrayLongitud = noticias.noticia.Length;
            info.podcasts = new podcasts[arrayLongitud];
            byte cont = 0;
            foreach (var objNoticia in noticias.noticia)
            {
                podcasts podcast = new podcasts();
                podcast.tipo = objNoticia.tipo;
                podcast.libre = objNoticia.libre;
                podcast.id = objNoticia.id;
                podcast.is3idfp = objNoticia.is3idfp;
                podcast.idaudio = objNoticia.idaudio;
                podcast.categoria = objNoticia.categoria;
                podcast.titulo = objNoticia.titulo;
                podcast.resumen = objNoticia.resumen;
                podcast.prevurl = objNoticia.prevurl;
                podcast.url = objNoticia.url;

                info.podcasts[cont] = podcast;
                cont++;
            }

            string path = @"C:\Users\ALIEN11\Documents\Jose Ramon Becerra Perez\JBecerraExamenGrupoReforma\NuevosDatosXML.xml";

            XmlSerializer inst = new XmlSerializer(typeof(info));
            using (TextWriter writer = new StreamWriter(path))
            {
                inst.Serialize(writer, info);
            }
        }
    }
}
