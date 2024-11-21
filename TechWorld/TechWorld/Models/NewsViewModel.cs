using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechWorld.Models
{
    public class NewsViewModel
    {
        public List<TinTuc> TinTuc { get; set; }
        public List<TinTuc> TinTucBanner {  get; set; }
    }
}