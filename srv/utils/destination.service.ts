import {
  Destination,
  DestinationFetchOptions,
  getDestination,
} from "@sap-cloud-sdk/connectivity";
import {
  HttpRequestConfig,
  HttpResponse,
  Method,
  executeHttpRequest,
} from "@sap-cloud-sdk/http-client";

export class DestinationService {
  constructor(
    private readonly destinationName: string,
    private readonly jwt?: string,
  ) {}

  public async getDestination(): Promise<Destination> {
    const destinationOptions: DestinationFetchOptions = {
      destinationName: this.destinationName,
      jwt: this.jwt,
      useCache: true,
    };

    const destination = await getDestination(destinationOptions);

    if (!destination) {
      throw new Error(
        `Destination with name ${this.destinationName} not found`,
      );
    }

    return destination;
  }

  public async makeRequest<T>(
    method: Method,
    path: string,
    data?: any,
    headers?: Record<string, any>,
  ): Promise<T> {
    const destination = await this.getDestination();

    const requestConfig: HttpRequestConfig = {
      method,
      url: path,
      data,
      headers: { ...(destination.headers ?? {}), ...(headers ?? {}) },
    };

    const response: HttpResponse = await executeHttpRequest(
      {
        ...destination,
        url: destination.url || "",
      },
      requestConfig,
    );

    if (response.status >= 400) {
      throw new Error(`${response.status} ${response.statusText}`);
    }

    return response.data;
  }
}
