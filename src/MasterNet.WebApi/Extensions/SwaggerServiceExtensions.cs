using Microsoft.OpenApi;
using Swashbuckle.AspNetCore.Annotations;

namespace MasterNet.WebApi.Extensions;

public static class SwaggerServiceExtensions
{

    public static IServiceCollection AddSwaggerDocumentation
    (
        this IServiceCollection services
    )
    {
        services.AddEndpointsApiExplorer();

        services.AddSwaggerGen(c =>
        {
            // Define el documento principal
            c.SwaggerDoc("v1", new OpenApiInfo
            {
                Title = "Pacagroup Ecommerce API",
                Version = "v1",
                Description = "API para gestión de clientes y operaciones de ecommerce",
                Contact = new OpenApiContact
                {
                    Name = "Equipo de desarrollo",
                    Email = "soporte@pacagroup.com",
                    Url = new Uri("https://pacagroup.com")
                },
                License = new OpenApiLicense
                {
                    Name = "MIT",
                    Url = new Uri("https://opensource.org/licenses/MIT")
                }
            });

            // (Opcional) si tienes comentarios XML para documentar tus endpoints
            var xmlFile = $"{System.Reflection.Assembly.GetExecutingAssembly().GetName().Name}.xml";
            var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
            if (File.Exists(xmlPath))
                c.IncludeXmlComments(xmlPath);

            OpenApiSecurityScheme securityScheme = new()
            {
                Name = "Authorization",
                Type = SecuritySchemeType.Http,
                Scheme = "bearer",
                BearerFormat = "JWT",
                In = ParameterLocation.Header,
                Description = "Pega solo el token (Swagger añade 'Bearer ' automáticamente)"
            };

            c.AddSecurityDefinition("Bearer", securityScheme);

            c.EnableAnnotations();
        });

//        services.AddSwaggerGen(c =>
//        {
//            var securitySchema = new OpenApiSecurityScheme
//            {
//                Description = "JWT Authorization Bearer Schema",
//                Name = "Authorization",
//                In = ParameterLocation.Header,
//                Type = SecuritySchemeType.Http,
//                Scheme = "Bearer",
//                BearerFormat = "JWT",
//                //Reference = new OpenApiReference
//                //{
//                //    Type = ReferenceType.SecurityScheme,
//                //    Id = "Bearer"
//                //}
//            };
//            c.AddSecurityDefinition("Bearer", securitySchema);

//            //var securityRequirement = new OpenApiSecurityRequirement
//            //{
//            //    { securitySchema, Array.Empty<string>() }
//            //};

//            //c.AddSecurityRequirement(securityRequirement);
//            var securityRequirement = new OpenApiSecurityRequirement
//{
//            { new OpenApiSecurityScheme { Reference = new OpenApiReference { Type = ReferenceType.SecurityScheme, Id = "Bearer" } }, Array.Empty<string>() }
//   };
//            c.AddSecurityRequirement(securityRequirement);
//        });


        return services;
    }

    public static IApplicationBuilder useSwaggerDocumentation(
        this IApplicationBuilder app
    )
    {

        app.UseSwagger();
        app.UseSwaggerUI();

        return app;
    }


}