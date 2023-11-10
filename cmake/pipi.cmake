include(FetchContent)

# TODO: FIX
set(PIPI_SOURCE_DIR	/Users/chchang/Systex/TEMP/PiPi)
set(PIPI_BINARY_DIR	${CMAKE_SOURCE_DIR}/ext-build/pipi)

FetchContent_Declare(
	pipi
	SOURCE_DIR		${PIPI_SOURCE_DIR}
	BINARY_DIR		${PIPI_BINARY_DIR}
)

FetchContent_MakeAvailable(pipi)