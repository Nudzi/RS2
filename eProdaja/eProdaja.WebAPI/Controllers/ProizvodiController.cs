using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using eProdaja.Model.Requests;
using eProdaja.WebAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace eProdaja.WebAPI.Controllers
{
    public class ProizvodiController : BaseCRUDController<Model.Proizvodi, ProizvodiSearchRequest, ProizvodiInsertRequest, ProizvodUpdateRequest>
    {
        //service from uppper child
        public ProizvodiController(ICRUDService<Model.Proizvodi, ProizvodiSearchRequest, ProizvodiInsertRequest, ProizvodUpdateRequest> service)
            : base(service)
        {

        }
    }
}