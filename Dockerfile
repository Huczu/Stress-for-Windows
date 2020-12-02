FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
WORKDIR /WindowsStress
COPY WindowsStress/. .
RUN msbuild /p:Configuration=Release

FROM mcr.microsoft.com/dotnet/framework/runtime:4.8 AS runtime
WORKDIR /WindowsStress
COPY --from=build /WindowsStress/bin/Release .
ENTRYPOINT ["WindowsStress.exe", "50", "1", "99999"]