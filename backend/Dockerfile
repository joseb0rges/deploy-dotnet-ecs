#### Build Application
# Use Microsoft's .NET SDK container as our build environment
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env

# Do our build work in the /app directory inside the build container
WORKDIR /app

# Copy the .csproj file into our working directory and fetch external dependancies (Nuget packages)
COPY *.csproj ./
RUN ls /app
RUN dotnet restore

# Copy our source code and build into the /app/out directory
COPY . ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:3.1
ARG CONNECTION_STRING
ENV CONNECTION_STRING=${CONNECTION_STRING}
# Copy the compiled app into our working directory (/app) 
WORKDIR /app
COPY --from=build-env /app/out ./

#RUN ls /app
# Define the command that should run when the runtime container starts up
ENTRYPOINT ["dotnet", "devOpsProject.dll"]