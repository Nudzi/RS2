using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using eProdaja.Model.Requests;
using eProdaja.WebAPI.Database;
using eProdaja.WebAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace eProdaja.WebAPI.Controllers
{
    //public class KorisniciController : BaseCRUDController<Model.Korisnici, KorisniciSearchRequest, KorisniciInsertRequest, ProizvodUpdateRequest>
    //{
    //    //service from uppper child
    //    public KorisniciController(ICRUDService<Model.Korisnici, KorisniciSearchRequest, KorisniciInsertRequest, ProizvodUpdateRequest> service)
    //        : base(service)
    //    {

    //    }
    //}
    [Route("api/[controller]")]
    [ApiController]
    public class KorisniciController : ControllerBase
    {
        protected IKorisniciService _service;

        public KorisniciController(IKorisniciService service)
        {
            _service = service;
        }

        [HttpGet]
        public IList<Model.Korisnici> GetAll([FromQuery]KorisniciSearchRequest request)
        {
            return _service.Get(request);
        }

        [HttpGet("{id}")]
        public Model.Korisnici GetById(int id)
        {
            return _service.GetById(id);
        }

        [HttpPost]
        public Model.Korisnici Insert(KorisniciInsertRequest korisnici)
        {
            return _service.Insert(korisnici);
        }

        [HttpPut("{id}")]
        public Model.Korisnici Update(int id, [FromBody]KorisniciUpdateRequest request)
        {
            return _service.Update(id, request);
        }
    }
}