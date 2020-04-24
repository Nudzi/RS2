using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace eProdaja.Model.Requests
{
    public class KorisniciInsertRequest
    {
        [Required]
        [MinLength(2)]
        public string Ime { get; set; }
        [Required]
        [MinLength(2)]

        public string Prezime { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public string Telefon { get; set; }

        [Required]
        [MinLength(2)]
        public string KorisnickoIme { get; set; }
        public string Password { get; set; }
        public string PasswordConfrimation { get; set; }
        public bool? Status { get; set; }
        public List<int> Uloge { get; set; } = new List<int>();
    }
}
