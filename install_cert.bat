@echo off
SETLOCAL

REM Define the path to the certificate file
SET CERT_PATH=C:\Vasanth\apache-jmeter-5.6.3\bin\ApacheJMeterTemporaryRootCA.crt  

REM Check if the certificate file exists
IF NOT EXIST "%CERT_PATH%" (
    echo Certificate file not found: %CERT_PATH%
    exit /b 1
)

REM Install the certificate into the Personal store
echo Installing certificate to Personal store...
certutil -addstore "Personal" "%CERT_PATH%"
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to install certificate to Personal store
    exit /b %ERRORLEVEL%
)

REM Install the certificate into the Trusted Root Certification Authorities store
echo Installing certificate to Trusted Root Certification Authorities store...
certutil -addstore "Root" "%CERT_PATH%"
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to install certificate to Trusted Root Certification Authorities store
    exit /b %ERRORLEVEL%
)

REM Install the certificate into the Enterprise Trust store
echo Installing certificate to Enterprise Trust store...
certutil -addstore "Trust" "%CERT_PATH%"
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to install certificate to Enterprise Trust store
    exit /b %ERRORLEVEL%
)

REM Install the certificate into the Intermediate Certification Authorities store
echo Installing certificate to Intermediate Certification Authorities store...
certutil -addstore "CA" "%CERT_PATH%"
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to install certificate to Intermediate Certification Authorities store
    exit /b %ERRORLEVEL%
)

REM Install the certificate into the Trusted Publishers store
echo Installing certificate to Trusted Publishers store...
certutil -addstore "TrustedPublisher" "%CERT_PATH%"
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to install certificate to Trusted Publishers store
    exit /b %ERRORLEVEL%
)

REM Install the certificate into the Untrusted Certificates store
echo Installing certificate to Untrusted Certificates store...
certutil -addstore "Disallowed" "%CERT_PATH%"
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to install certificate to Untrusted Certificates store
    exit /b %ERRORLEVEL%
)

echo Certificate installed successfully to all specified stores.
ENDLOCAL
