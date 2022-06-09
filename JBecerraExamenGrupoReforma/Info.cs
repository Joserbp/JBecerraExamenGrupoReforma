using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace JBecerraExamenGrupoReforma
{
    [XmlTypeAttribute(AnonymousType = true)]
    [XmlRootAttribute("info", Namespace = "", IsNullable = false)]
    public class info
    {
        [XmlElementAttribute("podcast")]
        public podcasts[] podcasts { get; set; }
    }

    [XmlTypeAttribute(AnonymousType = true)]
    public class podcasts
    {
        [XmlAttributeAttribute()]
        public byte tipo { get; set; }

        [XmlAttributeAttribute()]
        public byte libre { get; set; }

        [XmlAttributeAttribute()]
        public byte id { get; set; }

        [XmlAttributeAttribute()]
        public string is3idfp { get; set; }

        [XmlAttributeAttribute()]
        public ushort idaudio { get; set; }
        public string categoria { get; set; }
        public string titulo { get; set; }
        public string resumen { get; set; }
        public string prevurl { get; set; }
        public string url { get; set; }
    }
}
