using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using eProdaja.WebAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace eProdaja.WebAPI.Controllers
{
    public class VrsteProizvodaController : BaseController<Model.JediniceMjere, object>
    {
        public VrsteProizvodaController(IService<Model.JediniceMjere, object> service) : base(service)
        {

        }
    }
}