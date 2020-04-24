using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using eProdaja.Model.Requests;
using eProdaja.WebAPI.Database;
using eProdaja.WebAPI.Services;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Microsoft.OpenApi.Models;

namespace eProdaja.WebAPI
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);
           services.AddAutoMapper();


            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "My API", Version = "v1" });
            });
            //services.AddScoped<IProizvodService, ProizvodService>();
            services.AddScoped<IService<Model.Uloge, object>, BaseService<Model.Uloge, object, Database.Uloge>>();
            services.AddScoped<IService<Model.JediniceMjere, object>, BaseService<Model.JediniceMjere, object, Database.JediniceMjere>>();
            services.AddScoped<IService<Model.VrsteProizvoda, object>, BaseService<Model.VrsteProizvoda, object, Database.VrsteProizvoda>>();
            services.AddScoped<IKorisniciService, KorisniciService>();
            services.AddScoped<ICRUDService<Model.Proizvodi, ProizvodiSearchRequest, ProizvodiInsertRequest, ProizvodUpdateRequest>,
                BaseCRUDService<Model.Proizvodi, ProizvodiSearchRequest, ProizvodiInsertRequest, ProizvodUpdateRequest, Database.Proizvodi>>();
            //services.AddScoped<ICRUDService<Model.Korisnici, KorisniciSearchRequest, KorisniciInsertRequest, KorisniciUpdateRequest>,
            //    BaseCRUDService<Model.Korisnici, KorisniciSearchRequest, KorisniciInsertRequest, KorisniciUpdateRequest, Database.Korisnici>>();

            //addtransient - always new instance
            //addsingleton - first time some values, every next time are same values, if they are private

            var connection = @"Server=.;Database=eProdaja;Trusted_Connection=True;ConnectRetryCount=0";
            services.AddDbContext<eProdajaContext>(options => options.UseSqlServer(connection));
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseMvc();
            app.UseSwagger();

            // Enable middleware to serve swagger-ui (HTML, JS, CSS, etc.),
            // specifying the Swagger JSON endpoint.
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "My API V1");
            });
        }
        
    }
}
