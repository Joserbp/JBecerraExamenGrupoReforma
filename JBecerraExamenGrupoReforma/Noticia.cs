using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace JBecerraExamenGrupoReforma
{
    [XmlTypeAttribute(AnonymousType = true)]
    [XmlRootAttribute(Namespace = "", IsNullable = false)]
    public partial class noticias
    {
                
        [XmlElementAttribute("noticia")]
        public noticiasNoticia[] noticia { get; set; }
        
        [XmlAttributeAttribute()]
        public uint horaPubl { get; set; }
    }


    [XmlTypeAttribute(AnonymousType = true)]
    public partial class noticiasNoticia
    {
        public byte libre { get; set; }
        public byte id { get; set; }
        public string categoria { get; set; }
        public string titulo { get; set; }
        public string resumen { get; set; }
        public string prevurl { get; set; }
        public string url { get; set; }
        public string is3idfp { get; set; }
        public ushort idaudio { get; set; }
        [XmlAttributeAttribute()]
        public byte tipo { get; set; }
    }


}