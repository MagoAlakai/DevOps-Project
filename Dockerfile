# Stage 1 - build
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

COPY ["src/MasterNet.WebApi/MasterNet.WebApi.csproj", "src/MasterNet.WebApi/"]
COPY ["src/MasterNet.Application/MasterNet.Application.csproj", "src/MasterNet.Application/"]
COPY ["src/MasterNet.Persistence/MasterNet.Persistence.csproj", "src/MasterNet.Persistence/"]
COPY ["src/MasterNet.Infrastructure/MasterNet.Infrastructure.csproj", "src/MasterNet.Infrastructure/"]
COPY ["src/MasterNet.Domain/MasterNet.Domain.csproj", "src/MasterNet.Domain/"]
COPY ["libs/Core.Mappy/Core.Mappy.csproj", "libs/Core.Mappy/"]
COPY ["libs/Core.MediatOR/Core.MediatOR.csproj", "libs/Core.MediatOR/"]

RUN dotnet restore "src/MasterNet.WebApi/MasterNet.WebApi.csproj"

COPY . .
WORKDIR "/src/src/MasterNet.WebApi"
RUN dotnet publish -c Release -o /app

# Stage 2 - runtime
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS runtime
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "MasterNet.WebApi.dll"]

