using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using eProdaja.Model;
using eProdaja.WebAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace eProdaja.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProizvodController : ControllerBase
    {
        private readonly IProizvodService _proizvodService;
        public ProizvodController (IProizvodService proizvodService)
        {
            _proizvodService = proizvodService;
        }
        [HttpGet]
        public ActionResult<IList<Proizvod>> Get()
        {
            var item = _proizvodService.Get();
            return Ok(item);
        }
        [HttpGet("{id}")]
        public ActionResult<Proizvod> GetById(int id)
        {
            var item = new Proizvod
            {
            Naziv = "Naziv1",
            ProizvodID = 1
            };

            return item;
        }
        [HttpPost]
        public Proizvod Insert(Proizvod p )
        {
            return new Proizvod
            {
                ProizvodID = -1,
                Naziv = p.Naziv
            };
        }
        [HttpPut("{id}")]
        public Proizvod Update(int id, Proizvod p)
        {
            return new Proizvod
            {
                ProizvodID = id,
                Naziv = p.Naziv
            };
        }
    }
}