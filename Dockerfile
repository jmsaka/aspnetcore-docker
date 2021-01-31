FROM mcr.microsoft.com/dotnet/sdk AS build
WORKDIR /code
COPY . .
RUN dotnet restore
RUN dotnet publish --output /output --configuration Release

FROM mcr.microsoft.com/dotnet/sdk
COPY --from=build /output /app
WORKDIR /app
ENTRYPOINT ["dotnet", "AspNetCoreOnDocker.dll"]
ENV ASPNETCORE_URLS=http://+:80  
EXPOSE 80